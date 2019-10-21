function [aeroForces] = paramSpace_1_1_1_1_2_2_1(sailStates,airStates)

	CL = (5.430819)*sailStates.alpha + (0.586051)*sailStates.beta + (-5.316965)*sailStates.p + (50.813477)*sailStates.q + (2.100709)*sailStates.r + (0.010611)*sailStates.de;
	CD = -5.558390;
	CY = (1.833782)*sailStates.alpha + (-0.030643)*sailStates.beta + (1.219184)*sailStates.p + (2.503999)*sailStates.q + (0.160331)*sailStates.r + (0.000561)*sailStates.de;

	Cl = (0.411340)*sailStates.alpha + (-0.594945)*sailStates.beta + (-3.626492)*sailStates.p + (31.246655)*sailStates.q + (2.221207)*sailStates.r + (0.004605)*sailStates.de;
	Cm = (-1.557627)*sailStates.alpha + (-2.328436)*sailStates.beta + (19.883406)*sailStates.p + (-217.910751)*sailStates.q + (-7.007069)*sailStates.r + (-0.078863)*sailStates.de;
	Cn = (-6.769004)*sailStates.alpha + (-0.105287)*sailStates.beta + (-3.303277)*sailStates.p + (15.232070)*sailStates.q + (-0.079364)*sailStates.r + (-0.000268)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end