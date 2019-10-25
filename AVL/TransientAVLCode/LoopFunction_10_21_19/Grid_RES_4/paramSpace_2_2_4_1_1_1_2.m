function [aeroForces] = paramSpace_2_2_4_1_1_1_2(sailStates,airStates)

	CL = (5.572983)*sailStates.alpha + (-0.164913)*sailStates.beta + (-2.642066)*sailStates.p + (37.509804)*sailStates.q + (-2.099891)*sailStates.r + (0.011626)*sailStates.de;
	CD = -1.770700;
	CY = (-0.221240)*sailStates.alpha + (-0.024552)*sailStates.beta + (-0.829324)*sailStates.p + (-1.693497)*sailStates.q + (-0.054536)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.204722)*sailStates.alpha + (0.436941)*sailStates.beta + (-1.253497)*sailStates.p + (10.659904)*sailStates.q + (-1.911433)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-12.681219)*sailStates.alpha + (0.624921)*sailStates.beta + (8.462376)*sailStates.p + (-137.990799)*sailStates.q + (7.109192)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (-0.017255)*sailStates.alpha + (0.032025)*sailStates.beta + (1.862931)*sailStates.p + (-7.110765)*sailStates.q + (0.002284)*sailStates.r + (0.000306)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end