# frozen_string_literal: true

require 'rails_helper'

describe Service do
  subject do
    Class.new do
      include Service

      def call
        'instance call'
      end
    end.call
  end

  context '#call' do
    it 'forwards #call to .call' do
      is_expected.to eq 'instance call'
    end

    context 'when call is not defined' do
      subject do
        Class.new do
          include Service
        end.call(nil)
      end

      it 'raises NotImplementedError' do
        expect { subject }.to raise_error NotImplementedError
      end
    end
  end
end
