function [aeroForces] = paramSpace_4_2_4_3_3_2_2(sailStates,airStates)

	CL = (3.765070)*sailStates.alpha + (0.073208)*sailStates.beta + (-2.493543)*sailStates.p + (35.274403)*sailStates.q + (0.873744)*sailStates.r + (0.010506)*sailStates.de;
	CD = 0.102230;
	CY = (0.061496)*sailStates.alpha + (-0.024405)*sailStates.beta + (0.165595)*sailStates.p + (0.489618)*sailStates.q + (-0.032886)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.184772)*sailStates.alpha + (-0.083020)*sailStates.beta + (-1.187325)*sailStates.p + (10.083123)*sailStates.q + (0.612832)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-13.404624)*sailStates.alpha + (-0.294915)*sailStates.beta + (8.324511)*sailStates.p + (-135.545776)*sailStates.q + (-2.982995)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.210182)*sailStates.alpha + (0.018387)*sailStates.beta + (-0.173955)*sailStates.p + (-0.455875)*sailStates.q + (-0.040671)*sailStates.r + (-0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end