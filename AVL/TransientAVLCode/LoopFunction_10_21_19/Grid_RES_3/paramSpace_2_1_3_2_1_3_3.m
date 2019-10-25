function [aeroForces] = paramSpace_2_1_3_2_1_3_3(sailStates,airStates)

	CL = (4.676365)*sailStates.alpha + (0.259783)*sailStates.beta + (-2.966758)*sailStates.p + (37.979282)*sailStates.q + (1.221818)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.591310;
	CY = (0.007861)*sailStates.alpha + (-0.025025)*sailStates.beta + (0.622877)*sailStates.p + (-0.771086)*sailStates.q + (-0.000072)*sailStates.r + (-0.000167)*sailStates.de;

	Cl = (1.752964)*sailStates.alpha + (-0.206561)*sailStates.beta + (-1.580236)*sailStates.p + (13.300278)*sailStates.q + (1.140857)*sailStates.r + (0.000992)*sailStates.de;
	Cm = (-14.711496)*sailStates.alpha + (-1.071971)*sailStates.beta + (10.133630)*sailStates.p + (-147.758499)*sailStates.q + (-4.177312)*sailStates.r + (-0.070714)*sailStates.de;
	Cn = (-0.138985)*sailStates.alpha + (0.000343)*sailStates.beta + (-1.356529)*sailStates.p + (6.618983)*sailStates.q + (-0.000155)*sailStates.r + (0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end