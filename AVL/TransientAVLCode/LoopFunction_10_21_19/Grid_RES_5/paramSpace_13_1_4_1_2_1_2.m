function [aeroForces] = paramSpace_13_1_4_1_2_1_2(sailStates,airStates)

	CL = (4.508759)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.935354)*sailStates.p + (35.272354)*sailStates.q + (-0.471866)*sailStates.r + (0.010072)*sailStates.de;
	CD = -0.694390;
	CY = (-0.032925)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.476765)*sailStates.p + (0.624082)*sailStates.q + (0.084133)*sailStates.r + (0.000134)*sailStates.de;

	Cl = (1.663692)*sailStates.alpha + (0.213494)*sailStates.beta + (-1.568883)*sailStates.p + (12.653193)*sailStates.q + (-0.621547)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.074977)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.966308)*sailStates.p + (-150.579605)*sailStates.q + (1.459834)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (-0.075153)*sailStates.alpha + (-0.037645)*sailStates.beta + (1.329901)*sailStates.p + (-7.568243)*sailStates.q + (-0.076446)*sailStates.r + (-0.000317)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end