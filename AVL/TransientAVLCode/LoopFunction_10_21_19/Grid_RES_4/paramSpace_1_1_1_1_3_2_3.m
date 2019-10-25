function [aeroForces] = paramSpace_1_1_1_1_3_2_3(sailStates,airStates)

	CL = (3.813356)*sailStates.alpha + (-0.341679)*sailStates.beta + (-3.263015)*sailStates.p + (42.625725)*sailStates.q + (-1.762240)*sailStates.r + (0.010774)*sailStates.de;
	CD = -0.004240;
	CY = (0.080266)*sailStates.alpha + (-0.032916)*sailStates.beta + (-0.611519)*sailStates.p + (2.326709)*sailStates.q + (-0.121889)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.703584)*sailStates.alpha + (0.083398)*sailStates.beta + (-1.869750)*sailStates.p + (17.252386)*sailStates.q + (-1.348146)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-12.738799)*sailStates.alpha + (1.289490)*sailStates.beta + (10.274725)*sailStates.p + (-155.326050)*sailStates.q + (5.889083)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.627418)*sailStates.alpha + (0.045253)*sailStates.beta + (0.968088)*sailStates.p + (-4.534669)*sailStates.q + (-0.001525)*sailStates.r + (-0.000728)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end