function [aeroForces] = paramSpace_1_4_2_1_3_1_3(sailStates,airStates)

	CL = (7.503968)*sailStates.alpha + (0.844187)*sailStates.beta + (-3.433879)*sailStates.p + (50.508930)*sailStates.q + (-4.004921)*sailStates.r + (0.012442)*sailStates.de;
	CD = -3.120820;
	CY = (-0.254216)*sailStates.alpha + (-0.017140)*sailStates.beta + (-1.629011)*sailStates.p + (2.326710)*sailStates.q + (-0.324114)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (3.171639)*sailStates.alpha + (0.985046)*sailStates.beta + (-1.829581)*sailStates.p + (18.156557)*sailStates.q + (-3.393804)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-11.800633)*sailStates.alpha + (-3.153610)*sailStates.beta + (8.813343)*sailStates.p + (-155.326050)*sailStates.q + (13.235947)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (1.836395)*sailStates.alpha + (0.128648)*sailStates.beta + (3.313064)*sailStates.p + (-15.288486)*sailStates.q + (0.056392)*sailStates.r + (-0.000970)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end