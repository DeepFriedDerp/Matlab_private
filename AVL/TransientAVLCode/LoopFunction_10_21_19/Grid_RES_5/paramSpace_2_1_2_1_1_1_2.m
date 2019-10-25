function [aeroForces] = paramSpace_2_1_2_1_1_1_2(sailStates,airStates)

	CL = (4.284414)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.091816)*sailStates.p + (44.295807)*sailStates.q + (-2.323136)*sailStates.r + (0.011777)*sailStates.de;
	CD = -0.608400;
	CY = (-0.242143)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.749464)*sailStates.p + (-0.550483)*sailStates.q + (-0.159284)*sailStates.r + (-0.000118)*sailStates.de;

	Cl = (1.261130)*sailStates.alpha + (0.396540)*sailStates.beta + (-1.610271)*sailStates.p + (15.058559)*sailStates.q + (-1.910663)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-10.854726)*sailStates.alpha + (0.000000)*sailStates.beta + (9.098083)*sailStates.p + (-149.810104)*sailStates.q + (7.724735)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (0.775630)*sailStates.alpha + (0.084287)*sailStates.beta + (1.422391)*sailStates.p + (-4.708606)*sailStates.q + (-0.031110)*sailStates.r + (0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end