function [aeroForces] = paramSpace_3_4_4_1_1_2_2(sailStates,airStates)

	CL = (4.170579)*sailStates.alpha + (-0.162511)*sailStates.beta + (-2.529722)*sailStates.p + (34.821056)*sailStates.q + (0.786257)*sailStates.r + (0.010825)*sailStates.de;
	CD = -0.029820;
	CY = (-0.213604)*sailStates.alpha + (-0.022443)*sailStates.beta + (0.371093)*sailStates.p + (-1.693497)*sailStates.q + (-0.024501)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.343181)*sailStates.alpha + (-0.166519)*sailStates.beta + (-1.139212)*sailStates.p + (9.138555)*sailStates.q + (0.620683)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.650401)*sailStates.alpha + (0.664295)*sailStates.beta + (8.490662)*sailStates.p + (-135.354233)*sailStates.q + (-2.673366)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.262463)*sailStates.alpha + (0.004758)*sailStates.beta + (-0.699364)*sailStates.p + (4.089918)*sailStates.q + (0.010043)*sailStates.r + (0.000520)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end