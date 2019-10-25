function [aeroForces] = paramSpace_4_2_3_2_1_1_3(sailStates,airStates)

	CL = (3.979929)*sailStates.alpha + (0.009032)*sailStates.beta + (-2.767678)*sailStates.p + (35.131428)*sailStates.q + (0.317597)*sailStates.r + (0.010065)*sailStates.de;
	CD = -0.192250;
	CY = (-0.140056)*sailStates.alpha + (-0.026137)*sailStates.beta + (-0.071718)*sailStates.p + (-1.057312)*sailStates.q + (0.014228)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.338651)*sailStates.alpha + (0.086357)*sailStates.beta + (-1.458376)*sailStates.p + (12.257504)*sailStates.q + (0.030453)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-14.455277)*sailStates.alpha + (-0.020408)*sailStates.beta + (9.827256)*sailStates.p + (-144.624481)*sailStates.q + (-1.121681)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.083475)*sailStates.alpha + (-0.017151)*sailStates.beta + (0.460024)*sailStates.p + (-2.334904)*sailStates.q + (-0.039816)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end