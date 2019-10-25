function [aeroForces] = paramSpace_2_1_2_1_3_1_2(sailStates,airStates)

	CL = (7.613068)*sailStates.alpha + (-0.659395)*sailStates.beta + (-2.587938)*sailStates.p + (37.463814)*sailStates.q + (-2.999755)*sailStates.r + (0.011387)*sailStates.de;
	CD = -2.990080;
	CY = (0.226170)*sailStates.alpha + (-0.026772)*sailStates.beta + (-1.406237)*sailStates.p + (1.693499)*sailStates.q + (-0.092229)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (2.951097)*sailStates.alpha + (0.432944)*sailStates.beta + (-1.255363)*sailStates.p + (11.048443)*sailStates.q + (-2.682439)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-15.074690)*sailStates.alpha + (2.560754)*sailStates.beta + (8.000269)*sailStates.p + (-135.354233)*sailStates.q + (10.155298)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.513088)*sailStates.alpha + (0.047051)*sailStates.beta + (3.028676)*sailStates.p + (-14.710938)*sailStates.q + (0.028113)*sailStates.r + (-0.000727)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end