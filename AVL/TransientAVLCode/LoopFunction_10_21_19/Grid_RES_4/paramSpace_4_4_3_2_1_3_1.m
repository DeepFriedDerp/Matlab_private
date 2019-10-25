function [aeroForces] = paramSpace_4_4_3_2_1_3_1(sailStates,airStates)

	CL = (4.692142)*sailStates.alpha + (-0.457452)*sailStates.beta + (-2.128419)*sailStates.p + (35.461758)*sailStates.q + (2.043298)*sailStates.r + (0.010950)*sailStates.de;
	CD = -0.629590;
	CY = (-0.195691)*sailStates.alpha + (-0.023290)*sailStates.beta + (0.768138)*sailStates.p + (-0.455225)*sailStates.q + (-0.152808)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.330639)*sailStates.alpha + (-0.488801)*sailStates.beta + (-0.799396)*sailStates.p + (7.166292)*sailStates.q + (1.654042)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-11.996249)*sailStates.alpha + (1.724490)*sailStates.beta + (5.926010)*sailStates.p + (-121.885399)*sailStates.q + (-6.779976)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.758537)*sailStates.alpha + (0.066222)*sailStates.beta + (-1.609597)*sailStates.p + (7.222748)*sailStates.q + (0.022771)*sailStates.r + (0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end