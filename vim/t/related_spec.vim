source ~/.vim/plugin/related.vim
describe 'GetRelatedFile'

  it 'change model'
    Expect GetRelatedFile('app/models/user.rb') == 'spec/models/user_spec.rb'
    Expect GetRelatedFile('spec/models/user_spec.rb') == 'app/models/user.rb'
  end

  it 'change nested model'
    Expect GetRelatedFile('app/models/login/user.rb') == 'spec/models/login/user_spec.rb'
    Expect GetRelatedFile('spec/models/login/user_spec.rb') == 'app/models/login/user.rb'
  end

  it 'change controller'
    Expect GetRelatedFile('app/controllers/yahoo_controller.rb') == 'spec/controllers/yahoo_controller_spec.rb'
    Expect GetRelatedFile('spec/controllers/yahoo_controller_spec.rb') == 'app/controllers/yahoo_controller.rb'
  end

  it 'change nested controller'
    Expect GetRelatedFile('app/controllers/api/yahoo_controller.rb') == 'spec/controllers/api/yahoo_controller_spec.rb'
    Expect GetRelatedFile('spec/controllers/api/yahoo_controller_spec.rb') == 'app/controllers/api/yahoo_controller.rb'
  end

  it 'change helper'
    Expect GetRelatedFile('app/helpers/yahoo_helper.rb') == 'spec/helpers/yahoo_helper_spec.rb'
    Expect GetRelatedFile('spec/helpers/yahoo_helper_spec.rb') == 'app/helpers/yahoo_helper.rb'
  end

  it 'change nested helper'
    Expect GetRelatedFile('app/helpers/api/yahoo_helper.rb') == 'spec/helpers/api/yahoo_helper_spec.rb'
    Expect GetRelatedFile('spec/helpers/api/yahoo_helper_spec.rb') == 'app/helpers/api/yahoo_helper.rb'
  end

  it 'change lib'
    Expect GetRelatedFile('lib/yahoo.rb') == 'spec/lib/yahoo_spec.rb'
    Expect GetRelatedFile('spec/lib/yahoo_spec.rb') == 'lib/yahoo.rb'
  end

  it 'change nested lib'
    Expect GetRelatedFile('lib/yahoo/yahoo.rb') == 'spec/lib/yahoo/yahoo_spec.rb'
    Expect GetRelatedFile('spec/lib/yahoo/yahoo_spec.rb') == 'lib/yahoo/yahoo.rb'
  end
end
