<?xml version="1.0" encoding="UTF-8"?>
  <!-- PDS4 Schematron for Name Space Id:psa  Version:1.3.0.0 - Mon Mar 08 17:45:12 CET 2021 -->
  <!-- Generated from the PDS4 Information Model Version 1.15.0.0 - System Build 11a -->
  <!-- *** This PDS4 schematron file is an operational deliverable. *** -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <sch:title>Schematron using XPath 2.0</sch:title>

  <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
  <sch:ns uri="http://pds.nasa.gov/pds4/pds/v1" prefix="pds"/>
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
    <sch:rule context="/pds:Product_Browse | /pds:Product_Thumbnail">
      <sch:assert test="
                starts-with(tokenize(pds:Identification_Area/pds:logical_identifier,':')[5], 'browse')
            ">
        Browse or thumbnail products should be in the browse[_...] collection.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Identification_Area[tokenize(pds:logical_identifier,':')[5]='data_calibrated']">
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level='Calibrated'">
        Products in the data_calibrated collection MUST have processing_level=Calibrated</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Identification_Area[starts-with(tokenize(pds:logical_identifier,':')[5], 'data_derived')]">
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level='Derived'">
        Products in the data_derived[_*] collections MUST have processing_level=Derived</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Document/pds:Identification_Area">
      <sch:assert test="
                tokenize(pds:logical_identifier,':')[5]=('document', 'calibration_files')
            ">
        Documents (Product_Document) are only allowed in the document or calibration_files collections</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Observing_System">
      <sch:assert test="pds:Observing_System_Component[pds:type eq 'Host']">
        Each product must have an Observing_System_Component of type Host</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Target_Identification">
      <sch:assert test="
                    not(pds:Internal_Reference/pds:lid_reference = (
                    'urn:nasa:pds:context:target:calibrator.stim_lamp',
                    'urn:nasa:pds:context:target:calibrator.test_image',
                    'urn:nasa:pds:context:target:calibrator.plaque',
                    'urn:nasa:pds:context:target:calibrator.responsivity',
                    'urn:nasa:pds:context:target:calibrator.calimg',
                    'urn:nasa:pds:context:target:calibrator.calibration',
                    'urn:nasa:pds:context:target:calibrator.cal_lamps',
                    'urn:nasa:pds:context:target:calibrator.ff_lamp',
                    'urn:nasa:pds:context:target:calibrator.cal'))
            ">
        
                The following Targets are not allowed in PSA: Test_image, Plaque, Responsivity, CalImage, Calibration, Cal_Lamps, FF_Lamp, Stim_Lamp, Cal
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Observation_Area | //pds:Context_Area">
      <sch:assert test="pds:Investigation_Area">
        All products MUST contain Investigation_Area in the Observation_Area or Context_Area</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:File">
      <sch:let name="label_name" value="lower-case(replace(tokenize(document-uri(/), '/')[last()],'\.[^.]+$',''))"/>
      <sch:let name="data_name" value="lower-case(replace(pds:file_name,'\.[^.]+$',''))"/>
      <sch:assert test="
                starts-with($data_name, $label_name)
            ">
        
                Data filename (<sch:value-of select="$data_name"/>) must have the same stem as the label (<sch:value-of select="$label_name"/>)
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Identification_Area">
      <sch:assert test="
                tokenize(pds:logical_identifier,':')[5]=
                    ('data_raw', 'data_partially_processed', 'calibration_files', 'calibration_raw', 
                    'calibration_partially_processed', 'document', 'geometry', 'context', 'spice_kernels', 'xml_schema')
                or starts-with(tokenize(pds:logical_identifier,':')[5], 'data_calibrated')
                or starts-with(tokenize(pds:logical_identifier,':')[5], 'data_derived')
                or starts-with(tokenize(pds:logical_identifier,':')[5], 'miscellaneous')
                or starts-with(tokenize(pds:logical_identifier,':')[5], 'browse')
            ">
        The following collections are allowed in the PSA:
    browse[_...]
    data_raw
    data_partially_processed
    data_calibrated[_...]
    data_derived[_...]
    document
    calibration_raw
    calibration_partially_processed
    calibration_files
    geometry
    miscellaneous[_....]
    spice_kernels
    xml_schema</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Product_Observational/pds:Identification_Area">
      <sch:let name="file-name" value="replace(tokenize(document-uri(/), '/')[last()],'\.[^.]+$','')"/>
      <sch:let name="lid" value="tokenize(pds:logical_identifier, ':')[last()]"/>
      <sch:assert test="
                lower-case($file-name) = $lid
            ">
        
                Label filename (<sch:value-of select="$file-name"/>) and last component of the LID (product ID) (<sch:value-of select="$lid"/>) must match for observational products
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area">
      <sch:assert test="pds:Mission_Area">
        Observational products MUST contain Mission_Area</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Mission_Area">
      <sch:assert test="psa:Mission_Information">
        Observational products MUST contain psa:Mission_Information</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Mission_Area/psa:Mission_Information">
      <sch:assert test="count(psa:mission_phase_name)=count(psa:mission_phase_identifier)">
        The number of mission_phase_name and mission_phase_identifier entries must be the same</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Identification_Area[not(pds:product_class='Product_SPICE_Kernel')]">
      <sch:assert test="pds:Modification_History">
        Products MUST contain Modification_History</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level">
      <sch:assert test=". != 'Telemetry'">
        
                The PSA does not archive telemetry - data should be unpacked and converted to a suitable format first.
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//pds:Identification_Area[starts-with(tokenize(pds:logical_identifier,':')[5], 'data_')]">
      <sch:assert test="parent::pds:Product_Observational">
        Only Product_Observational products should appear in a data collection</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Identification_Area[tokenize(pds:logical_identifier,':')[5]=('data_partially_processed', 'calibration_partially_processed')]">
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level='Partially Processed'">
        Products in the data_partially_processed or calibration_partially_processed collections MUST have processing_level=Partially Processed</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="pds:Target_Identification[pds:type eq 'Planet']">
      <sch:assert test="
                starts-with(pds:Internal_Reference/pds:lid_reference,'urn:nasa:pds:context:target:planet.') or
                starts-with(pds:Internal_Reference/pds:lidvid_reference,'urn:nasa:pds:context:target:planet.')
            ">
        
                If the target is a planet, the LID or LIDVID should start: urn:nasa:pds:context:target:planet.
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Identification_Area[tokenize(pds:logical_identifier,':')[5]=
            ('data_raw', 'data_partially_processed', 'data_calibrated', 'calibration_raw', 'calibration_partially_processed')]">
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary">
        
                Observational products MUST contain Primary_Results_Summary
            </sch:assert>
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:Science_Facets">
        
                Observational products MUST contain Primary_Results_Summary/Science_Facets
            </sch:assert>
      <sch:assert test="parent::*/pds:Observation_Area/pds:Observing_System/pds:Observing_System_Component[pds:type eq 'Instrument']">
        Each product must have an Observing_System_Component of type Instrument</sch:assert>
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:Science_Facets/pds:wavelength_range">
        
                Observational products MUST contain Primary_Results_Summary/Science_Facets/wavelength_range
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Observation_Area/pds:Primary_Result_Summary">
      <sch:assert test="pds:processing_level">
        Observational products MUST contain Primary_Result_Summary/processing_level</sch:assert>
      <sch:assert test="pds:purpose">
        Observational products MUST contain Primary_Result_Summary/purpose</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="//psa:Processing_Inputs/psa:Processing_Input_Identification">
      <sch:assert test="psa:type = (
                'telemetry',
                'PDS product',
                'SPICE kernel',
                'auxiliary')
            ">
        The attribute psa:processing_input_identification must be equal to one of the following values:
'telemetry','PDS product','SPICE kernel','auxiliary'.
            </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational[
            (pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level=('Raw', 'Partially Processed', 'Calibrated')) and
            (starts-with(tokenize(pds:Identification_Area/pds:logical_identifier,':')[5], 'data'))]">
      <sch:assert test="tokenize(tokenize(pds:Identification_Area/pds:logical_identifier,':')[6],'_')[2]=('raw','par','cal')">
        PSA observational data products should have the form: {instr}_{level}_{hk|sc}_* - level must be raw, par or cal</sch:assert>
      <sch:assert test="tokenize(tokenize(pds:Identification_Area/pds:logical_identifier,':')[6],'_')[3]=('hk','sc')">
        PSA observational data products should have the form: {instr}_{level}_{hk|sc}_* - hk or sc is required in 3rd place</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="psa:Processing_Input_Identification/psa:type">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="psa:Sub-Instrument/psa:subtype">
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="psa:Sub-Instrument/psa:type">
      <sch:assert test=". = ('Accelerometer', 'Biology experiment', 'Chemistry laboratory', 'Compilation', 'Dust analyser', 'Electric field instrument', 'Gamma ray detector', 'Gas analyser', 'Gravimeter', 'Imager', 'Imaging spectrometer', 'Interferometer', 'Langmuir probe', 'Magnetometer', 'Mass spectrometer', 'Microphone', 'Microscope', 'Mutual impedance probe', 'Neutron detector', 'Not applicable', 'Particle analyser', 'Polarimeter', 'Radar', 'Radio Receiver', 'Radio science', 'Relaxation sounder', 'SPICE kernels', 'Seismometer', 'Sensor suite', 'Spacecraft sensors', 'Spectrograph', 'Spectrometer', 'Spectrum analyser', 'Sub-surface tool', 'Surface tool', 'Temperature sensor', 'Weather station')">
        The attribute psa:type must be equal to one of the following values 'Accelerometer', 'Biology experiment', 'Chemistry laboratory', 'Compilation', 'Dust analyser', 'Electric field instrument', 'Gamma ray detector', 'Gas analyser', 'Gravimeter', 'Imager', 'Imaging spectrometer', 'Interferometer', 'Langmuir probe', 'Magnetometer', 'Mass spectrometer', 'Microphone', 'Microscope', 'Mutual impedance probe', 'Neutron detector', 'Not applicable', 'Particle analyser', 'Polarimeter', 'Radar', 'Radio Receiver', 'Radio science', 'Relaxation sounder', 'SPICE kernels', 'Seismometer', 'Sensor suite', 'Spacecraft sensors', 'Spectrograph', 'Spectrometer', 'Spectrum analyser', 'Sub-surface tool', 'Surface tool', 'Temperature sensor', 'Weather station'.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_Observational/pds:Identification_Area[tokenize(pds:logical_identifier,':')[5]=('data_raw', 'calibration_raw')]">
      <sch:assert test="parent::*/pds:Observation_Area/pds:Primary_Result_Summary/pds:processing_level='Raw'">
        Products in the data_raw or calibration_raw collections MUST have processing_level=Raw</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:rule context="/pds:Product_SPICE_Kernel">
      <sch:assert test="tokenize(pds:Identification_Area/pds:logical_identifier,':')[5] = 'spice_kernels'">
        Product_SPICE_Kernel can ONLY be in the spice_kernels collection</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
