function [aeroForces] = paramSpace_2_4_2_1_1_3_3(sailStates,airStates)

	CL = (6.813090)*sailStates.alpha + (-0.483547)*sailStates.beta + (-3.390728)*sailStates.p + (39.126320)*sailStates.q + (2.212288)*sailStates.r + (0.010781)*sailStates.de;
	CD = -2.766640;
	CY = (0.273491)*sailStates.alpha + (-0.026512)*sailStates.beta + (1.205298)*sailStates.p + (-1.471501)*sailStates.q + (0.079051)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (2.699815)*sailStates.alpha + (-0.679879)*sailStates.beta + (-1.864898)*sailStates.p + (15.082949)*sailStates.q + (2.109521)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-15.561624)*sailStates.alpha + (1.867719)*sailStates.beta + (12.329535)*sailStates.p + (-161.242615)*sailStates.q + (-7.468355)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (-0.993414)*sailStates.alpha + (-0.028598)*sailStates.beta + (-2.778279)*sailStates.p + (14.179460)*sailStates.q + (-0.035896)*sailStates.r + (0.000699)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end