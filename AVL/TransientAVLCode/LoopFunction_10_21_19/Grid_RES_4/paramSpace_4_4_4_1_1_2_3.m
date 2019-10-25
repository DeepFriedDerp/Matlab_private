function [aeroForces] = paramSpace_4_4_4_1_1_2_3(sailStates,airStates)

	CL = (3.813356)*sailStates.alpha + (-0.341679)*sailStates.beta + (-3.263015)*sailStates.p + (42.625725)*sailStates.q + (1.762240)*sailStates.r + (0.010774)*sailStates.de;
	CD = -0.004240;
	CY = (-0.080266)*sailStates.alpha + (-0.016657)*sailStates.beta + (0.611519)*sailStates.p + (-2.326709)*sailStates.q + (-0.121889)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (1.601920)*sailStates.alpha + (-0.335502)*sailStates.beta + (-1.775393)*sailStates.p + (16.064491)*sailStates.q + (1.329250)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-12.738799)*sailStates.alpha + (1.289490)*sailStates.beta + (10.274725)*sailStates.p + (-155.326050)*sailStates.q + (-5.889083)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-0.549297)*sailStates.alpha + (0.038072)*sailStates.beta + (-0.986857)*sailStates.p + (4.770956)*sailStates.q + (0.002234)*sailStates.r + (0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end