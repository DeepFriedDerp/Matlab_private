function [aeroForces] = paramSpace_1_1_2_2_3_1_2(sailStates,airStates)

	CL = (4.804492)*sailStates.alpha + (-0.397220)*sailStates.beta + (-2.534759)*sailStates.p + (38.321785)*sailStates.q + (-2.089540)*sailStates.r + (0.011235)*sailStates.de;
	CD = -0.637150;
	CY = (0.104389)*sailStates.alpha + (-0.026744)*sailStates.beta + (-0.788749)*sailStates.p + (0.759370)*sailStates.q + (-0.139078)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.698406)*sailStates.alpha + (0.239564)*sailStates.beta + (-1.218415)*sailStates.p + (11.233439)*sailStates.q + (-1.715486)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-12.873714)*sailStates.alpha + (1.476033)*sailStates.beta + (7.433429)*sailStates.p + (-133.652283)*sailStates.q + (6.956429)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.121231)*sailStates.alpha + (0.067626)*sailStates.beta + (1.585903)*sailStates.p + (-7.034867)*sailStates.q + (0.015033)*sailStates.r + (-0.000344)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end