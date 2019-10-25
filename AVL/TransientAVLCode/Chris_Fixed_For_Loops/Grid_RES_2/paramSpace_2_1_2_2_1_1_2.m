function [aeroForces] = paramSpace_2_1_2_2_1_1_2(sailStates,airStates)

	CL = (5.194211)*sailStates.alpha + (-2.935889)*sailStates.beta + (-6.671820)*sailStates.p + (77.923668)*sailStates.q + (6.018752)*sailStates.r + (0.014632)*sailStates.de;
	CD = -9.861060;
	CY = (4.185066)*sailStates.alpha + (-0.027259)*sailStates.beta + (2.455770)*sailStates.p + (0.435916)*sailStates.q + (-0.323092)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (-2.265337)*sailStates.alpha + (-2.099110)*sailStates.beta + (-4.379364)*sailStates.p + (41.566334)*sailStates.q + (5.484172)*sailStates.r + (0.005574)*sailStates.de;
	Cm = (15.883368)*sailStates.alpha + (12.030746)*sailStates.beta + (19.548342)*sailStates.p + (-242.871140)*sailStates.q + (-20.484514)*sailStates.r + (-0.079956)*sailStates.de;
	Cn = (-16.032452)*sailStates.alpha + (0.160822)*sailStates.beta + (-4.929019)*sailStates.p + (18.903742)*sailStates.q + (-0.005564)*sailStates.r + (0.000393)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end