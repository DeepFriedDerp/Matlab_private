function [aeroForces] = paramSpace_1_3_2_3_2_2_1(sailStates,airStates)

	CL = (3.853705)*sailStates.alpha + (0.151367)*sailStates.beta + (-2.232882)*sailStates.p + (32.873837)*sailStates.q + (-0.784646)*sailStates.r + (0.010485)*sailStates.de;
	CD = 0.054810;
	CY = (-0.002977)*sailStates.alpha + (-0.025268)*sailStates.beta + (-0.169312)*sailStates.p + (-0.173374)*sailStates.q + (-0.029854)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.000230)*sailStates.alpha + (0.132335)*sailStates.beta + (-0.917057)*sailStates.p + (7.311205)*sailStates.q + (-0.519307)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-13.710646)*sailStates.alpha + (-0.548463)*sailStates.beta + (7.436732)*sailStates.p + (-127.559647)*sailStates.q + (2.645002)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.003213)*sailStates.alpha + (0.017715)*sailStates.beta + (0.258490)*sailStates.p + (-0.652906)*sailStates.q + (-0.017477)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end