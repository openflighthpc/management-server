# frozen_string_literal: true
#==============================================================================
# Copyright (C) 2019-present OpenFlightHPC
#
# This file is part of management-server
#
# This program and the accompanying materials are made available under
# the terms of the Eclipse Public License 2.0 which is available at
# <https://www.eclipse.org/legal/epl-2.0>, or alternative license
# terms made available by Alces Flight Ltd - please direct inquiries
# about licensing to licensing@alces-flight.com.
#
# This project is distributed in the hope that it will be useful, but
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR
# IMPLIED INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OR CONDITIONS
# OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A
# PARTICULAR PURPOSE. See the Eclipse Public License 2.0 for more
# details.
#
# You should have received a copy of the Eclipse Public License 2.0
# along with this project. If not, see:
#
#  https://opensource.org/licenses/EPL-2.0
#
# For more information on flight-account, please visit:
# https://github.com/openflighthpc/management-server
#===============================================================================

require 'sinatra/base'
require 'sinatra/namespace'
require 'app/cloud_command'

module App
  class Routes < Sinatra::Base
    register Sinatra::Namespace

    get '/' do
      'openFlightHPC - Next generation HPC on any platform'
    end

    namespace '/cloud' do
      namespace '/power/:node' do
        get '' do
          CloudCommand.power_status(node_param).stdout
        end

        get '/on' do
          CloudCommand.power_on(node_param).stdout
        end

        get '/off' do
          CloudCommand.power_off(node_param).stdout
        end
      end
    end

    private

    def node_param
      params[:node]
    end
  end
end

