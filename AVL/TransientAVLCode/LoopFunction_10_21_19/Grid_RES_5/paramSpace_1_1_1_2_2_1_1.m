function [aeroForces] = paramSpace_1_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.058790)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.263753)*sailStates.p + (36.280918)*sailStates.q + (-1.776873)*sailStates.r + (0.010616)*sailStates.de;
	CD = -0.131940;
	CY = (0.080916)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.571397)*sailStates.p + (0.199283)*sailStates.q + (-0.142487)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.247281)*sailStates.alpha + (0.277869)*sailStates.beta + (-0.977691)*sailStates.p + (9.012042)*sailStates.q + (-1.376635)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-11.824262)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.560875)*sailStates.p + (-127.104668)*sailStates.q + (5.887053)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.215324)*sailStates.alpha + (0.069280)*sailStates.beta + (1.094490)*sailStates.p + (-4.230811)*sailStates.q + (-0.009829)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end