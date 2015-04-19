require 'spec_helper'

describe SlimLint::Linter::TrailingWhitespace do
  include_context 'linter'

  context 'when line contains trailing spaces' do
    let(:slim) { '- some_code_with_trailing_whitespace      ' }

    it { should report_lint line: 1 }
  end

  context 'when line contains trailing tabs' do
    let(:slim) { "- some_code_with_trailing_whitespace\t" }

    it { should report_lint line: 1 }
  end

  context 'when line contains trailing newline' do
    let(:slim) { "- some_code_with_trailing_whitespace\n" }

    it { should_not report_lint }
  end

  context 'when line contains no trailing whitespace' do
    let(:slim) { '- some_code_without_trailing_whitespace' }

    it { should_not report_lint }
  end
end
