function [aeroForces] = paramSpace_1_1_1_1_2_1_1(sailStates,airStates)

	CL = (3.475162)*sailStates.alpha + (0.182662)*sailStates.beta + (-4.283155)*sailStates.p + (46.001217)*sailStates.q + (0.491601)*sailStates.r + (0.010787)*sailStates.de;
	CD = -1.145370;
	CY = (0.562697)*sailStates.alpha + (-0.029298)*sailStates.beta + (0.419493)*sailStates.p + (1.928946)*sailStates.q + (0.055091)*sailStates.r + (0.000424)*sailStates.de;

	Cl = (0.972694)*sailStates.alpha + (-0.270536)*sailStates.beta + (-2.730996)*sailStates.p + (23.725437)*sailStates.q + (0.685744)*sailStates.r + (0.002982)*sailStates.de;
	Cm = (-9.602389)*sailStates.alpha + (-0.743070)*sailStates.beta + (15.307359)*sailStates.p + (-186.577881)*sailStates.q + (-1.617830)*sailStates.r + (-0.074207)*sailStates.de;
	Cn = (-1.556492)*sailStates.alpha + (-0.043312)*sailStates.beta + (-1.358786)*sailStates.p + (6.280382)*sailStates.q + (-0.041144)*sailStates.r + (-0.000384)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end