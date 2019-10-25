function [aeroForces] = paramSpace_1_2_1_3_1_2_1(sailStates,airStates)

	CL = (3.756753)*sailStates.alpha + (-0.068515)*sailStates.beta + (-2.242969)*sailStates.p + (33.137184)*sailStates.q + (-0.772297)*sailStates.r + (0.010386)*sailStates.de;
	CD = 0.096030;
	CY = (-0.070446)*sailStates.alpha + (-0.024177)*sailStates.beta + (-0.134546)*sailStates.p + (-0.684401)*sailStates.q + (-0.026689)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.061472)*sailStates.alpha + (0.078587)*sailStates.beta + (-0.981590)*sailStates.p + (8.101439)*sailStates.q + (-0.529921)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-13.390594)*sailStates.alpha + (0.279001)*sailStates.beta + (7.515707)*sailStates.p + (-128.521423)*sailStates.q + (2.643940)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.143441)*sailStates.alpha + (0.016971)*sailStates.beta + (0.150144)*sailStates.p + (0.506811)*sailStates.q + (-0.037083)*sailStates.r + (0.000198)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end