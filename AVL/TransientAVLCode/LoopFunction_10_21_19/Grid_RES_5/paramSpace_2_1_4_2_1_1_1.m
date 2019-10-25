function [aeroForces] = paramSpace_2_1_4_2_1_1_1(sailStates,airStates)

	CL = (4.037463)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.321678)*sailStates.p + (35.497276)*sailStates.q + (-1.392965)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.071980;
	CY = (-0.040751)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.372356)*sailStates.p + (-0.571905)*sailStates.q + (-0.079208)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.093436)*sailStates.alpha + (0.208843)*sailStates.beta + (-1.011139)*sailStates.p + (8.817022)*sailStates.q + (-1.035398)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-13.004386)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.213475)*sailStates.p + (-129.462372)*sailStates.q + (4.617411)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.039334)*sailStates.alpha + (0.044391)*sailStates.beta + (0.708826)*sailStates.p + (-2.285365)*sailStates.q + (-0.023908)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end