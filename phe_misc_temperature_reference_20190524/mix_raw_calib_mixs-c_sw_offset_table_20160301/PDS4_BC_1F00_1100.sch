<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:bc  Version:1.1.0.0 - Fri Mar 12 09:08:03 CET 2021 -->
  <!-- Generated from the PDS4 Information Model Version 1.15.0.0 - System Build 11a -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>
  <sch:ns uri="http://psa.esa.int/psa/bc/v1" prefix="bc"/>
  <sch:ns uri="http://psa.esa.int/psa/v1" prefix="psa"/>

		   <!-- ================================================ -->
		   <!-- NOTE:  There are two types of schematron rules.  -->
		   <!--        One type includes rules written for       -->
		   <!--        specific situations. The other type are   -->
		   <!--        generated to validate enumerated value    -->
		   <!--        lists. These two types of rules have been -->
		   <!--        merged together in the rules below.       -->
		   <!-- ================================================ -->
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'BELA']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:bela.mpo','urn:esa:psa:context:instrument:mpo.bela')">
        <title>bela_rules/Rule</title>
        The instrument context LID for BELA must be: urn:esa:psa:context:instrument:bela.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_bela'">
        <title>bela_rules/Rule</title>
        BELA bundles must have a bundle identifier bc_mpo_bela</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Identification_Area">
      <sch:assert test="starts-with(tokenize(pds:logical_identifier,':')[4], 'bc')">
        <title>bepi_bundle/Rule</title>
        BepiColombo bundles must have a LID starting bc</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'BERM']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:berm.mpo','urn:esa:psa:context:instrument:mpo.berm')">
        <title>berm_rules/Rule</title>
        The instrument context LID for BERM must be: urn:esa:psa:context:instrument:berm.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_berm'">
        <title>berm_rules/Rule</title>
        BERM bundles must have a bundle identifier bc_mpo_berm</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Observing_System_Component[pds:type eq 'Spacecraft']">
      <sch:assert test="pds:Internal_Reference/pds:lid_reference = 
                ('urn:esa:psa:context:instrument_host:spacecraft.mpo', 
                 'urn:esa:psa:context:instrument_host:spacecraft.mmo',
                 'urn:esa:psa:context:instrument_host:spacecraft.mtm')">
        <title>host_spacecraft_lid/Rule</title>
        The internal reference for the instrument host must be equal to one of the following values:
                'urn:esa:psa:context:instrument_host:spacecraft.mpo', 
                'urn:esa:psa:context:instrument_host:spacecraft.mmo',
                'urn:esa:psa:context:instrument_host:spacecraft.mtm'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Observing_System_Component[pds:type eq 'Spacecraft']">
      <sch:assert test="pds:name = ('Mercury Planetary Orbiter', 'Mercury Magnetospheric Orbiter', 'Mercury Transfer Module')">
        <title>host_spacecraft_name/Rule</title>
        The attribute pds:name must be equal to one of the following values: 'Mercury Planetary Orbiter', 'Mercury Magnetospheric Orbiter', 'Mercury Transfer Module'</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Produce_Observational/pds:Identification_Area[not(starts-with(tokenize(pds:logical_identifier,':')[5], 'miscellaneous'))]">
      <sch:assert test="count(../pds:Observation_Area/pds:Observing_System/pds:Observing_System_Component[pds:type eq 'Instrument']) = 1">
        <title>instrument_component/Rule</title>
        Each product must have ONE Observing_System_Component of type Instrument</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Observing_System_Component[pds:type eq 'Instrument']">
      <sch:assert test="pds:name = (
                'BELA',
                'BERM',
                'ISA',
                'MPO-MAG',
                'MCAM',
                'MERTIS',
                'MGNS',
                'MIXS',
                'MORE',
                'PHEBUS',
                'SERENA',
                'SIMBIO-SYS',
                'SIXS')">
        <title>instrument_name/Rule</title>
        
                The attribute pds:name must be equal to one of the following values
                'BELA', 'BERM', 'ISA', 'MPO-MAG', 'MCAM', 'MERTIS', 'MGNS', 'MIXS', 'MORE', 'PHEBUS',
                'SERENA', 'SIMBIO-SYS', 'SIXS')
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Investigation_Area">
      <sch:assert test="pds:type = 'Mission'">
        <title>investigation_area/Rule</title>
        The attribute Investigation_Area/type type must be equal to 'Mission'.</sch:assert>
      <sch:assert test="pds:name = 'BepiColombo'">
        <title>investigation_area/Rule</title>
        The attribute Investigation_Area/name must be equal to 'BepiColombo'.</sch:assert>
      <sch:assert test="pds:Internal_Reference/pds:lid_reference = 'urn:esa:psa:context:investigation:mission.bc'">
        <title>investigation_area/Rule</title>
        The attribute Investigation_Area/Internal_Reference/lid_reference must be equal to: 'urn:esa:psa:context:investigation:mission.bc'
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'ISA']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:isa.mpo','urn:esa:psa:context:instrument:mpo.isa')">
        <title>isa_rules/Rule</title>
        The instrument context LID for ISA must be: urn:esa:psa:context:instrument:isa.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_isa'">
        <title>isa_rules/Rule</title>
        ISA bundles must have a bundle identifier bc_mpo_isa</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational[(pds:Observation_Area/pds:Observing_System/pds:Observing_System_Component/pds:name = 'MPO-MAG') and
            (tokenize(pds:Identification_Area/pds:logical_identifier,':')[5] = ('data_raw', 'data_partially_processed'))]">
      <sch:assert test="pds:Observation_Area/pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('IB', 'OB')">
        <title>mag_raw_par_rules/Rule</title>
        Sub-instrument for MPO-MAG must be IB or OB in all RAW or PAR products</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MPO-MAG']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:mag.mpo','urn:esa:psa:context:instrument:mpo.mag')">
        <title>mag_rules/Rule</title>
        The instrument context LID for MPO-MAG must be: urn:esa:psa:context:instrument:mag.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_mag'">
        <title>mag_rules/Rule</title>
        MPO-MAG bundles must have a bundle identifier bc_mpo_mag</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MCAM']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:mcam.mtm','urn:esa:psa:context:instrument:mtm.mcam')">
        <title>mcam_rules/Rule</title>
        The instrument context LID for MCAM must be: urn:esa:psa:context:instrument:mcam.mtm</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('CAM1', 'CAM2', 'CAM3')">
        <title>mcam_rules/Rule</title>
        Sub-instrument for MCAM must be CAM1, CAM2 or CAM3</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mtm_mcam'">
        <title>mcam_rules/Rule</title>
        MCAM bundles must have a bundle identifier bc_mtm_mcam</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MERTIS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:mertis.mpo', 'urn:esa:psa:context:instrument:mpo.mertis')">
        <title>mertis_rules/Rule</title>
        The instrument context LID for MERTIS must be: urn:esa:psa:context:instrument:mertis.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('TIR', 'TIS')">
        <title>mertis_rules/Rule</title>
        Sub-instrument for MERTIS must be TIR or TIS</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_mertis'">
        <title>mertis_rules/Rule</title>
        MERTIS bundles must have a bundle identifier bc_mpo_mertis</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MGNS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:mgns.mpo', 'urn:esa:psa:context:instrument:mpo.mgns')">
        <title>mgns_rules/Rule</title>
        The instrument context LID for MGNS must be: urn:esa:psa:context:instrument:mgns.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_mgns'">
        <title>mgns_rules/Rule</title>
        MGNS bundles must have a bundle identifier bc_mpo_mgns</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="psa.Mission_Information">
      <sch:assert test="psa:mission_phase_identifier = (
                'testing',
                'sft-tbtv',
                'sft2',
                'magnetic',
                'svt1a',
                'svt1b',
                'mst',
                'svt1c',
                'svt2',
                'necp',
                'cruise',
                'ega',
                'vga1',
                'vga2',
                'mga1',
                'mga2',
                'mga3',
                'mga4',
                'mga5',
                'mga6',
                'mocp',
                'msp')">
        <title>mission_phase_id/Rule</title>
        The attribute psa:mission_phase_identifier must be equal to one of the following values:
                'testing', 
                'sft-tbtv',
                'sft2',
                'magnetic',
                'svt1a',
                'svt1b',
                'mst',
                'svt1c',
                'svt2',
                'necp',
                'cruise',
                'ega',
                'vga1',
                'vga2',
                'mga1',
                'mga2',
                'mga3',
                'mga4',
                'mga5',
                'mga6',
                'mocp',
                'msp'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="psa:Mission_Information">
      <sch:assert test="psa:mission_phase_name = (
                'On-ground Testing and Calibration Campaign',
                'SFT TBTV Campaign on PFM',
                'SFT2 Test Campaign on PFM',
                'Magnetic Test Campaign on PFM',
                'SVT1a Test Campaign',
                'SVT1b Test Campaign',
                'MST Test Campaign',
                'SVT1c Test Campaign',
                'SVT2 Test Campaign',
                'Near-Earth Commissioning Phase',
                'Cruise',
                'Earth Gravity Assist',
                'Venus Gravity Assist 1',
                'Venus Gravity Assist 2',
                'Mercury Gravity Assist 1',
                'Mercury Gravity Assist 2',
                'Mercury Gravity Assist 3',
                'Mercury Gravity Assist 4',
                'Mercury Gravity Assist 5',
                'Mercury Gravity Assist 6',
                'Mercury Orbit Commissioning Phase',
                'Mercury Science Phase')">
        <title>mission_phase_name/Rule</title>
        The attribute psa:mission_phase_name must be equal to one of the following values
                'On-ground Testing and Calibration Campaign',
                'SFT TBTV Campaign on PFM',
                'SFT2 Test Campaign on PFM',
                'Magnetic Test Campaign on PFM',
                'SVT1a Test Campaign',
                'SVT1b Test Campaign',
                'MST Test Campaign',
                'SVT1c Test Campaign',
                'SVT2 Test Campaign',
                'Near-Earth Commissioning Phase',
                'Cruise',
                'Earth Gravity Assist',
                'Venus Gravity Assist 1',
                'Venus Gravity Assist 2',
                'Mercury Gravity Assist 1',
                'Mercury Gravity Assist 2',
                'Mercury Gravity Assist 3',
                'Mercury Gravity Assist 4',
                'Mercury Gravity Assist 5',
                'Mercury Gravity Assist 6',
                'Mercury Orbit Commissioning Phase',
                'Mercury Science Phase'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MIXS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:mixs.mpo','urn:esa:psa:context:instrument:mpo.mixs')">
        <title>mixs_rules/Rule</title>
        The instrument context LID for MIXS must be: urn:esa:psa:context:instrument:mixs.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('MIXS-T', 'MIXS-C')">
        <title>mixs_rules/Rule</title>
        Sub-instrument for MIXS must be MIXS-T or MIXS-C</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_mixs'">
        <title>mixs_rules/Rule</title>
        MIXS bundles must have a bundle identifier bc_mpo_mixs</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'MORE']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:more.mpo', 'urn:esa:psa:context:instrument:mpo.more')">
        <title>more_rules/Rule</title>
        The instrument context LID for MORE must be: urn:esa:psa:context:instrument:more.mpo</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_more'">
        <title>more_rules/Rule</title>
        MORE bundles must have a bundle identifier bc_mpo_more</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Mission_Area/psa:Mission_Information/psa:spacecraft_clock_start_count">
      <sch:assert test="matches(., '^[1-9]/[0-9]{10}:[0-9]{5}$')">
        <title>obt_start/Rule</title>
        spacecraft_clock_start_count must follow the format: P/SSSSSSSSSS:FFFFF</sch:assert>
      <sch:assert test="number(tokenize(.,':')[2]) le 65535">
        <title>obt_start/Rule</title>
        Fractional part of the OBT cannot be > 65535</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Mission_Area/psa:Mission_Information/psa:spacecraft_clock_stop_count">
      <sch:assert test="matches(., '^[1-9]/[0-9]{10}:[0-9]{5}$')">
        <title>obt_stop/Rule</title>
        spacecraft_clock_stop_count must follow the format: P/SSSSSSSSSS.FFFFF</sch:assert>
      <sch:assert test="number(tokenize(.,':')[2]) le 65535">
        <title>obt_stop/Rule</title>
        Fractional part of the OBT cannot be > 65535</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'PHEBUS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:phebus.mpo','urn:esa:psa:context:instrument:mpo.phebus')">
        <title>phebus_rules/Rule</title>
        The instrument context LID for PHEBUS must be: urn:esa:psa:context:instrument:phebus.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('FUV', 'EUV')">
        <title>phebus_rules/Rule</title>
        Sub-instrument for PHEBUS must be FUV or EUV</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_phebus'">
        <title>phebus_rules/Rule</title>
        PHEBUS bundles must have a bundle identifier bc_mpo_phebus</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Mission_Area">
      <sch:assert test="psa:Processing_Context">
        <title>pipeline_info/Rule</title>
        Observational products MUST contain the psa:Processing_Context class</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'SERENA']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:serena.mpo','urn:esa:psa:context:instrument:mpo.serena')">
        <title>serena_rules/Rule</title>
        The instrument context LID for SERENA must be: urn:esa:psa:context:instrument:serena.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('ELENA', 'MIPA', 'PICAM', 'STROFIO')">
        <title>serena_rules/Rule</title>
        Sub-instrument for SERENA must be ELENA, MIPA, PICAM, or STROFIO</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_serena'">
        <title>serena_rules/Rule</title>
        SERENA bundles must have a bundle identifier bc_mpo_serena</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'SIMBIO-SYS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:simbio-sys.mpo','urn:esa:psa:context:instrument:mpo.simbio-sys')">
        <title>simbio-sys_rules/Rule</title>
        The instrument context LID for SIMBIO-SYS must be: urn:esa:psa:context:instrument:simbio-sys.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('STC', 'VIHI', 'HRIC')">
        <title>simbio-sys_rules/Rule</title>
        Sub-instrument for SIMBIO-SYS must be STC, VIHI or HRIC</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_simbio-sys'">
        <title>simbio-sys_rules/Rule</title>
        SIMBIO-SYS bundles must have a bundle identifier bc_mpo_simbio-sys</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area[pds:Observing_System/pds:Observing_System_Component/pds:name = 'SIXS']">
      <sch:assert test="pds:Observing_System/pds:Observing_System_Component/pds:Internal_Reference/pds:lid_reference = ('urn:esa:psa:context:instrument:sixs.mpo','urn:esa:psa:context:instrument:mpo.sixs')">
        <title>sixs_rules/Rule</title>
        The instrument context LID for SIMBIO-SYS must be: urn:esa:psa:context:instrument:sixs.mpo</sch:assert>
      <sch:assert test="pds:Mission_Area/psa:Sub-Instrument/psa:identifier = ('SIXS-X', 'SIXS-P')">
        <title>sixs_rules/Rule</title>
        Sub-instrument for SIXS must be SIXS-X or SIXS-P</sch:assert>
      <sch:assert test="tokenize(parent::*/pds:Identification_Area/pds:logical_identifier,':')[4] = 'bc_mpo_sixs'">
        <title>sixs_rules/Rule</title>
        SIXS bundles must have a bundle identifier bc_mpo_sixs</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
