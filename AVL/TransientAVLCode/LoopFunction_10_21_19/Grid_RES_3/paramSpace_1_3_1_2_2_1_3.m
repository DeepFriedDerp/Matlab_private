function [aeroForces] = paramSpace_1_3_1_2_2_1_3(sailStates,airStates)

	CL = (4.385868)*sailStates.alpha + (0.415056)*sailStates.beta + (-2.944681)*sailStates.p + (41.560787)*sailStates.q + (-2.045492)*sailStates.r + (0.011335)*sailStates.de;
	CD = -0.491990;
	CY = (-0.088709)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.729805)*sailStates.p + (0.267958)*sailStates.q + (-0.128710)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.452306)*sailStates.alpha + (0.472805)*sailStates.beta + (-1.466282)*sailStates.p + (13.199496)*sailStates.q + (-1.685880)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-12.133554)*sailStates.alpha + (-1.611991)*sailStates.beta + (8.925046)*sailStates.p + (-145.513718)*sailStates.q + (6.854199)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.396050)*sailStates.alpha + (0.060759)*sailStates.beta + (1.408419)*sailStates.p + (-5.584870)*sailStates.q + (-0.003554)*sailStates.r + (-0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end