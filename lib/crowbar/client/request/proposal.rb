#
# Copyright 2015, SUSE Linux GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Crowbar
  module Client
    class Request
      module Proposal
        extend ActiveSupport::Concern

        included do
          def proposal_commit(barclamp, proposal)
            result = self.class.post(
              "/crowbar/#{barclamp}/1.0/proposals/commit/#{proposal}.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_show(barclamp, proposal)
            result = self.class.get(
              "/crowbar/#{barclamp}/1.0/proposals/#{proposal}.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_dequeue(barclamp, proposal)
            result = self.class.delete(
              "/crowbar/#{barclamp}/1.0/proposals/dequeue/#{proposal}.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_delete(barclamp, proposal)
            result = self.class.delete(
              "/crowbar/#{barclamp}/1.0/proposals/#{proposal}.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_list(barclamp)
            result = self.class.get(
              "/crowbar/#{barclamp}/1.0/proposals.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_template(barclamp)
            result = self.class.get(
              "/crowbar/#{barclamp}/1.0/proposals/template.json"
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_create(barclamp, proposal, payload)
            result = self.class.put(
              "/crowbar/#{barclamp}/1.0/proposals.json",
              body: payload.to_json,
              headers: {
                "Content-Type" => "application/json"
              }
            )

            if block_given?
              yield result
            else
              result
            end
          end

          def proposal_update(barclamp, proposal, payload)
            result = self.class.post(
              "/crowbar/#{barclamp}/1.0/proposals/#{proposal}.json",
              body: payload.to_json,
              headers: {
                "Content-Type" => "application/json"
              }
            )

            if block_given?
              yield result
            else
              result
            end
          end
        end
      end
    end
  end
end
