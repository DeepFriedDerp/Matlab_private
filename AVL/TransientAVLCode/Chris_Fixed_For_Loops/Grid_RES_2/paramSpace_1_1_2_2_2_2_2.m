function [aeroForces] = paramSpace_1_1_2_2_2_2_2(sailStates,airStates)

	CL = (5.213120)*sailStates.alpha + (0.761809)*sailStates.beta + (-6.121178)*sailStates.p + (55.962231)*sailStates.q + (2.475029)*sailStates.r + (0.010950)*sailStates.de;
	CD = -8.096170;
	CY = (2.753881)*sailStates.alpha + (-0.032755)*sailStates.beta + (1.401391)*sailStates.p + (4.151950)*sailStates.q + (0.184791)*sailStates.r + (0.000944)*sailStates.de;

	Cl = (-1.409952)*sailStates.alpha + (-0.724493)*sailStates.beta + (-4.311516)*sailStates.p + (37.441711)*sailStates.q + (2.660489)*sailStates.r + (0.005835)*sailStates.de;
	Cm = (8.092742)*sailStates.alpha + (-3.167920)*sailStates.beta + (22.897745)*sailStates.p + (-240.899185)*sailStates.q + (-8.355388)*sailStates.r + (-0.082730)*sailStates.de;
	Cn = (-10.618850)*sailStates.alpha + (-0.125767)*sailStates.beta + (-3.833418)*sailStates.p + (16.658632)*sailStates.q + (-0.080416)*sailStates.r + (-0.000702)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end