function [aeroForces] = paramSpace_1_2_1_2_2_1_2(sailStates,airStates)

	CL = (5.082280)*sailStates.alpha + (-0.769516)*sailStates.beta + (-6.096354)*sailStates.p + (55.836739)*sailStates.q + (2.408549)*sailStates.r + (0.011019)*sailStates.de;
	CD = -7.906840;
	CY = (2.710469)*sailStates.alpha + (-0.017368)*sailStates.beta + (1.370345)*sailStates.p + (4.339474)*sailStates.q + (0.181024)*sailStates.r + (0.000986)*sailStates.de;

	Cl = (-1.536243)*sailStates.alpha + (-0.990379)*sailStates.beta + (-4.194134)*sailStates.p + (36.085091)*sailStates.q + (2.629885)*sailStates.r + (0.005514)*sailStates.de;
	Cm = (7.806445)*sailStates.alpha + (3.259388)*sailStates.beta + (22.769131)*sailStates.p + (-240.050644)*sailStates.q + (-8.173752)*sailStates.r + (-0.082581)*sailStates.de;
	Cn = (-10.165106)*sailStates.alpha + (-0.100141)*sailStates.beta + (-3.741504)*sailStates.p + (15.894814)*sailStates.q + (-0.075435)*sailStates.r + (-0.000808)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end