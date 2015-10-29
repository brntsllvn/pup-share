module PupsHelper

  def male
    raw [
      image_tag('male.png', class: 'paw male')
      ].join()
  end

  def female
    raw [
      image_tag('female.png', class: 'paw')
      ].join()
  end

  def xsml
    raw [
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw')
      ].join()
  end

  def sml
    raw [
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw')
      ].join()
  end

  def med
    raw [
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-gray.png', class: 'paw')
      ].join()
  end

  def lrg
    raw [
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw'),
      image_tag('paw-black.png', class: 'paw')
      ].join()
  end

  def mellow
    raw [
      image_tag('lightning-bolt-orange.png', class: 'paw'), 
      image_tag('lightning-bolt-gray.png', class: 'paw'), 
      image_tag('lightning-bolt-gray.png', class: 'paw')
      ].join()
  end

  def temperate
    raw [
      image_tag('lightning-bolt-orange.png', class: 'paw'), 
      image_tag('lightning-bolt-orange.png', class: 'paw'),
      image_tag('lightning-bolt-gray.png', class: 'paw')
      ].join()
  end

  def energetic
    raw [
      image_tag('lightning-bolt-orange.png', class: 'paw'), 
      image_tag('lightning-bolt-orange.png', class: 'paw'), 
      image_tag('lightning-bolt-orange.png', class: 'paw')
      ].join()
  end

  def gender_icon(pup)
    case pup.male_female
    when 'm'
      return male
    else
      female
    end
  end

  def energy_icon(pup)
    case pup.personality
    when 'mellow'
      return mellow
    when 'temperate'
      return temperate
    else
      energetic
    end
  end

  def size_icon(pup)
    case pup.size 
    when 1
      return xsml
    when 2
      return sml
    when 3
      return med
    else
      return lrg
    end
  end

end