function [aeroForces] = paramSpace_3_3_1_2_1_2_2(sailStates,airStates)

	CL = (4.125113)*sailStates.alpha + (-0.021712)*sailStates.beta + (-2.559284)*sailStates.p + (34.986626)*sailStates.q + (0.521370)*sailStates.r + (0.011085)*sailStates.de;
	CD = 0.013520;
	CY = (-0.096948)*sailStates.alpha + (-0.024783)*sailStates.beta + (0.177562)*sailStates.p + (-0.769435)*sailStates.q + (-0.011557)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.272959)*sailStates.alpha + (-0.068821)*sailStates.beta + (-1.187077)*sailStates.p + (9.596967)*sailStates.q + (0.355871)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.843838)*sailStates.alpha + (0.047406)*sailStates.beta + (8.673260)*sailStates.p + (-136.832825)*sailStates.q + (-1.725597)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.094602)*sailStates.alpha + (0.003647)*sailStates.beta + (-0.325170)*sailStates.p + (1.955789)*sailStates.q + (0.002686)*sailStates.r + (0.000264)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end