RSpec.describe SpainDni do

  it 'has a version number' do
    expect(SpainDni::VERSION).not_to be nil
  end

  context 'When valid Dni number' do
    let(:valid_dnis)  { %w(53428132Y 39364118D 92569233Y) }

    it 'Checks validity and type of DNI' do
      valid_dnis.each do |dni|
        id = SpainDni::Dni.new(dni)
        expect(id.valid?).to be true
        expect(id.id_type).to eq('DNI')
        expect(id).to be_dni
      end
    end
  end

  context 'When valid NIE number' do
    let(:valid_nies) { %w(X6801233H Y2716810H Y0305620X) }

    it 'Checks validity and type of NIE' do
      valid_nies.each do |nie|
        id = SpainDni::Dni.new(nie)
        expect(id.valid?).to be true
        expect(id.id_type).to eq('NIE')
        expect(id).to be_nie
      end
    end
  end

  context 'When invalid id number' do
    let(:invalid_ids) { %w(X6801213H Y2516810H 39364118M 53498132Y) }

    it 'Returns false for invalid numbers' do
      invalid_ids.each do |invalid|
        id = SpainDni::Dni.new(invalid)
        expect(id.valid?).to be false
        expect(id.id_type).to be_nil
      end
    end
  end
end
