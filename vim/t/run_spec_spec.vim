source ~/.vim/plugin/run_spec.vim

describe 'TestCommand'
  it 'send dev-2'
    Expect TestCommand('app/models/user.rb') == ":!ssh dev-2 'source ~/.zshrc;tmux send-keys -t 0 \"spec app/models/user.rb\" C-m'"
  end
  it 'send dev-2 with fullpath'
    Expect TestCommand('/Users/marocchino/Project/yahoo/app/models/user.rb') == ":!ssh dev-2 'source ~/.zshrc;tmux send-keys -t 0 \"spec app/models/user.rb\" C-m'"
  end
end
