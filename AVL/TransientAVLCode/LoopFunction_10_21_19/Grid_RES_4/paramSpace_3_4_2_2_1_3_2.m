function [aeroForces] = paramSpace_3_4_2_2_1_3_2(sailStates,airStates)

	CL = (4.788416)*sailStates.alpha + (-0.321494)*sailStates.beta + (-2.565836)*sailStates.p + (35.944798)*sailStates.q + (1.536753)*sailStates.r + (0.011128)*sailStates.de;
	CD = -0.605730;
	CY = (-0.098817)*sailStates.alpha + (-0.024046)*sailStates.beta + (0.668854)*sailStates.p + (-0.769435)*sailStates.q + (-0.043812)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.526236)*sailStates.alpha + (-0.400168)*sailStates.beta + (-1.153565)*sailStates.p + (9.439751)*sailStates.q + (1.320244)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.380569)*sailStates.alpha + (1.200842)*sailStates.beta + (8.379099)*sailStates.p + (-135.788696)*sailStates.q + (-5.188214)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.305321)*sailStates.alpha + (0.017511)*sailStates.beta + (-1.419416)*sailStates.p + (6.856694)*sailStates.q + (0.011399)*sailStates.r + (0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end