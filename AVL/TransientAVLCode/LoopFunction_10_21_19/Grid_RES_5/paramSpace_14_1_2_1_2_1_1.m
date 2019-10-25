function [aeroForces] = paramSpace_14_1_2_1_2_1_1(sailStates,airStates)

	CL = (4.592989)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.906739)*sailStates.p + (26.095751)*sailStates.q + (-0.709284)*sailStates.r + (0.009456)*sailStates.de;
	CD = -0.780940;
	CY = (0.276647)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.581159)*sailStates.p + (1.364607)*sailStates.q + (0.123480)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (1.242121)*sailStates.alpha + (0.236509)*sailStates.beta + (-0.741769)*sailStates.p + (4.704378)*sailStates.q + (-0.868185)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-16.155066)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.779198)*sailStates.p + (-122.335159)*sailStates.q + (2.238161)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (-1.023842)*sailStates.alpha + (-0.050271)*sailStates.beta + (1.405492)*sailStates.p + (-7.626476)*sailStates.q + (-0.080675)*sailStates.r + (-0.000490)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end