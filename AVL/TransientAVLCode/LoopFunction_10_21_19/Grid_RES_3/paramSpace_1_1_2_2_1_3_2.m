function [aeroForces] = paramSpace_1_1_2_2_1_3_2(sailStates,airStates)

	CL = (4.333569)*sailStates.alpha + (0.072485)*sailStates.beta + (-2.436821)*sailStates.p + (31.686333)*sailStates.q + (0.340257)*sailStates.r + (0.009975)*sailStates.de;
	CD = -0.438120;
	CY = (-0.087046)*sailStates.alpha + (-0.022918)*sailStates.beta + (0.394798)*sailStates.p + (-0.759371)*sailStates.q + (0.069614)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.458825)*sailStates.alpha + (-0.147133)*sailStates.beta + (-1.199692)*sailStates.p + (9.469890)*sailStates.q + (0.499767)*sailStates.r + (0.000490)*sailStates.de;
	Cm = (-15.318514)*sailStates.alpha + (-0.305037)*sailStates.beta + (9.086835)*sailStates.p + (-135.573257)*sailStates.q + (-1.067037)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.415623)*sailStates.alpha + (-0.037971)*sailStates.beta + (-1.056920)*sailStates.p + (6.011972)*sailStates.q + (-0.060941)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end