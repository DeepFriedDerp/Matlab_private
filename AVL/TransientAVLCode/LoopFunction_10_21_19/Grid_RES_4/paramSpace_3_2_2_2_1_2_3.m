function [aeroForces] = paramSpace_3_2_2_2_1_2_3(sailStates,airStates)

	CL = (4.049802)*sailStates.alpha + (0.031366)*sailStates.beta + (-2.961260)*sailStates.p + (38.261776)*sailStates.q + (0.582612)*sailStates.r + (0.011256)*sailStates.de;
	CD = 0.010370;
	CY = (-0.074899)*sailStates.alpha + (-0.025256)*sailStates.beta + (0.208789)*sailStates.p + (-0.870358)*sailStates.q + (-0.013654)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.452276)*sailStates.alpha + (-0.056038)*sailStates.beta + (-1.548168)*sailStates.p + (13.050475)*sailStates.q + (0.424891)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.528317)*sailStates.alpha + (-0.101303)*sailStates.beta + (10.012764)*sailStates.p + (-147.878265)*sailStates.q + (-1.950846)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.036701)*sailStates.alpha + (0.004718)*sailStates.beta + (-0.356971)*sailStates.p + (1.967846)*sailStates.q + (0.002121)*sailStates.r + (0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end