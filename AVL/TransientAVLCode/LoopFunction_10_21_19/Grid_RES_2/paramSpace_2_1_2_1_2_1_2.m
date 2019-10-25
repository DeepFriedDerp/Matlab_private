function [aeroForces] = paramSpace_2_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.678129)*sailStates.alpha + (-0.104996)*sailStates.beta + (-2.982372)*sailStates.p + (36.008129)*sailStates.q + (-0.735553)*sailStates.r + (0.010407)*sailStates.de;
	CD = -0.776790;
	CY = (-0.036063)*sailStates.alpha + (-0.023788)*sailStates.beta + (-0.552120)*sailStates.p + (0.715006)*sailStates.q + (0.072739)*sailStates.r + (0.000154)*sailStates.de;

	Cl = (1.772987)*sailStates.alpha + (0.217776)*sailStates.beta + (-1.622419)*sailStates.p + (13.239444)*sailStates.q + (-0.815799)*sailStates.r + (0.001138)*sailStates.de;
	Cm = (-15.167176)*sailStates.alpha + (0.390173)*sailStates.beta + (10.954284)*sailStates.p + (-150.764221)*sailStates.q + (2.410882)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (0.022227)*sailStates.alpha + (-0.038511)*sailStates.beta + (1.428818)*sailStates.p + (-7.842690)*sailStates.q + (-0.052745)*sailStates.r + (-0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end