function [aeroForces] = paramSpace_1_2_3_2_2_3_3(sailStates,airStates)

	CL = (4.208008)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.825573)*sailStates.p + (35.269909)*sailStates.q + (0.012104)*sailStates.r + (0.010413)*sailStates.de;
	CD = -0.334480;
	CY = (0.074512)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.249136)*sailStates.p + (0.267957)*sailStates.q + (0.043955)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.399334)*sailStates.alpha + (-0.135259)*sailStates.beta + (-1.473812)*sailStates.p + (12.098435)*sailStates.q + (0.261217)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-15.055022)*sailStates.alpha + (0.000000)*sailStates.beta + (10.196718)*sailStates.p + (-146.430145)*sailStates.q + (-0.018833)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.099786)*sailStates.alpha + (-0.023850)*sailStates.beta + (-0.790627)*sailStates.p + (4.136406)*sailStates.q + (-0.047841)*sailStates.r + (-0.000027)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end