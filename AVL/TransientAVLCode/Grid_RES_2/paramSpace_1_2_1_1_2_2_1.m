function [aeroForces] = paramSpace_1_2_1_1_2_2_1(sailStates,airStates)

	CL = (8.008559)*sailStates.alpha + (-0.530801)*sailStates.beta + (-2.564686)*sailStates.p + (29.285772)*sailStates.q + (0.330409)*sailStates.r + (0.008613)*sailStates.de;
	CD = -5.193660;
	CY = (1.975360)*sailStates.alpha + (0.002808)*sailStates.beta + (-0.264627)*sailStates.p + (16.141970)*sailStates.q + (-0.032552)*sailStates.r + (0.003437)*sailStates.de;

	Cl = (-2.074060)*sailStates.alpha + (-0.531324)*sailStates.beta + (-1.371773)*sailStates.p + (11.304353)*sailStates.q + (0.995961)*sailStates.r + (0.000330)*sailStates.de;
	Cm = (-12.657122)*sailStates.alpha + (2.515770)*sailStates.beta + (9.264592)*sailStates.p + (-137.895859)*sailStates.q + (-1.349763)*sailStates.r + (-0.068382)*sailStates.de;
	Cn = (-2.072727)*sailStates.alpha + (-0.086508)*sailStates.beta + (-0.047993)*sailStates.p + (-11.321700)*sailStates.q + (0.144373)*sailStates.r + (-0.004563)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end