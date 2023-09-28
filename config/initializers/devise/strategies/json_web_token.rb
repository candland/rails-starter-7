module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        bearer_header.present?
      end

      def authenticate!
        return if no_claims_or_no_claimed_user_id

        user = User.find_by_id(claims["user_id"])

        request.params[:claims] = claims

        Rails.logger.debug("Success JWT Auth #{user}")

        success! user
      end

      protected

      def bearer_header
        request.headers["Authorization"].to_s
      end

      def no_claims_or_no_claimed_user_id
        !claims || !claims.key?("user_id")
      end

      private

      def claims
        @claims ||= get_claims
      end

      def get_claims
        strategy, token = bearer_header.split(" ")

        return nil if (strategy || "").downcase != "bearer"

        request.params[:token] = token

        return nil unless ApiToken.active.where(token: token).exists?

        begin
          JsonToken.decode(token)
        rescue => e
          Rails.logger.error("JSON Decode Error #{e.message}")
          nil
        end
      end
    end
  end
end
