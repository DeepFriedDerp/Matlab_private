function [aeroForces] = paramSpace_1_3_4_1_2_3_1(sailStates,airStates)

	CL = (5.544997)*sailStates.alpha + (-0.131594)*sailStates.beta + (-1.458599)*sailStates.p + (20.013557)*sailStates.q + (1.619092)*sailStates.r + (0.008828)*sailStates.de;
	CD = -2.119720;
	CY = (-0.424135)*sailStates.alpha + (-0.025612)*sailStates.beta + (0.936930)*sailStates.p + (-0.662188)*sailStates.q + (0.186296)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.978954)*sailStates.alpha + (-0.480238)*sailStates.beta + (-0.394402)*sailStates.p + (0.873655)*sailStates.q + (1.729158)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-16.690380)*sailStates.alpha + (0.538319)*sailStates.beta + (6.903971)*sailStates.p + (-110.966957)*sailStates.q + (-5.289543)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (2.024815)*sailStates.alpha + (-0.084028)*sailStates.beta + (-2.149106)*sailStates.p + (9.998643)*sailStates.q + (-0.068203)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end