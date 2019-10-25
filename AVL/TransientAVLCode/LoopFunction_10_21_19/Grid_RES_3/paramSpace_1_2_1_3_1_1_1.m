function [aeroForces] = paramSpace_1_2_1_3_1_1_1(sailStates,airStates)

	CL = (4.051985)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.306611)*sailStates.p + (35.171070)*sailStates.q + (-1.334342)*sailStates.r + (0.010938)*sailStates.de;
	CD = -0.124250;
	CY = (-0.040790)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.415897)*sailStates.p + (-0.665000)*sailStates.q + (-0.073271)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.077492)*sailStates.alpha + (0.234470)*sailStates.beta + (-0.989115)*sailStates.p + (8.435750)*sailStates.q + (-1.070994)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-12.754140)*sailStates.alpha + (0.000000)*sailStates.beta + (7.246861)*sailStates.p + (-129.097870)*sailStates.q + (4.498890)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.108963)*sailStates.alpha + (0.041343)*sailStates.beta + (0.807751)*sailStates.p + (-2.567904)*sailStates.q + (-0.015996)*sailStates.r + (0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end