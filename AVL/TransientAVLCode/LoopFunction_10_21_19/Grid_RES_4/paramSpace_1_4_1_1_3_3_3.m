function [aeroForces] = paramSpace_1_4_1_1_3_3_3(sailStates,airStates)

	CL = (4.661068)*sailStates.alpha + (-0.182133)*sailStates.beta + (-3.093098)*sailStates.p + (34.693626)*sailStates.q + (0.490178)*sailStates.r + (0.009196)*sailStates.de;
	CD = -1.399690;
	CY = (0.420233)*sailStates.alpha + (-0.016657)*sailStates.beta + (0.420503)*sailStates.p + (2.326710)*sailStates.q + (0.083393)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.218994)*sailStates.alpha + (-0.322920)*sailStates.beta + (-1.721615)*sailStates.p + (13.970252)*sailStates.q + (0.759249)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-13.864687)*sailStates.alpha + (0.708375)*sailStates.beta + (11.747272)*sailStates.p + (-155.326050)*sailStates.q + (-1.513909)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-0.518347)*sailStates.alpha + (-0.053355)*sailStates.beta + (-1.361320)*sailStates.p + (5.757492)*sailStates.q + (-0.051447)*sailStates.r + (-0.000502)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end