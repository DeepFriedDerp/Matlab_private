function [aeroForces] = paramSpace_4_4_1_3_1_1_2(sailStates,airStates)

	CL = (3.936788)*sailStates.alpha + (-0.037327)*sailStates.beta + (-2.397964)*sailStates.p + (32.692616)*sailStates.q + (0.430292)*sailStates.r + (0.010143)*sailStates.de;
	CD = -0.061120;
	CY = (-0.059444)*sailStates.alpha + (-0.023380)*sailStates.beta + (-0.026765)*sailStates.p + (-0.489618)*sailStates.q + (0.005376)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.100354)*sailStates.alpha + (0.006892)*sailStates.beta + (-1.082779)*sailStates.p + (8.644695)*sailStates.q + (0.117447)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-14.567835)*sailStates.alpha + (0.008626)*sailStates.beta + (8.388472)*sailStates.p + (-133.122269)*sailStates.q + (-1.447325)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.138542)*sailStates.alpha + (-0.002834)*sailStates.beta + (0.242266)*sailStates.p + (-1.200497)*sailStates.q + (-0.029110)*sailStates.r + (0.000131)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end