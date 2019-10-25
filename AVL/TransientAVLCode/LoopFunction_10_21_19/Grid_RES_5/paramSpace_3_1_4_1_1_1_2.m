function [aeroForces] = paramSpace_3_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.388145)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.112913)*sailStates.p + (43.284267)*sailStates.q + (-2.089447)*sailStates.r + (0.011949)*sailStates.de;
	CD = -0.598350;
	CY = (-0.231890)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.674242)*sailStates.p + (-0.624084)*sailStates.q + (-0.118954)*sailStates.r + (-0.000134)*sailStates.de;

	Cl = (1.303019)*sailStates.alpha + (0.362021)*sailStates.beta + (-1.625396)*sailStates.p + (14.797371)*sailStates.q + (-1.712577)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-11.923352)*sailStates.alpha + (0.000000)*sailStates.beta + (9.483420)*sailStates.p + (-150.579605)*sailStates.q + (6.950035)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (0.685888)*sailStates.alpha + (0.063834)*sailStates.beta + (1.314728)*sailStates.p + (-4.591994)*sailStates.q + (-0.019759)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end