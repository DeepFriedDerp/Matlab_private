function [aeroForces] = paramSpace_1_1_1_2_2_1_3(sailStates,airStates)

	CL = (4.385868)*sailStates.alpha + (-0.415055)*sailStates.beta + (-2.944681)*sailStates.p + (41.560787)*sailStates.q + (-2.045493)*sailStates.r + (0.011335)*sailStates.de;
	CD = -0.491990;
	CY = (-0.088709)*sailStates.alpha + (-0.025572)*sailStates.beta + (-0.729805)*sailStates.p + (0.267958)*sailStates.q + (-0.128710)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.553025)*sailStates.alpha + (0.227902)*sailStates.beta + (-1.550900)*sailStates.p + (14.260366)*sailStates.q + (-1.700902)*sailStates.r + (0.000963)*sailStates.de;
	Cm = (-12.133553)*sailStates.alpha + (1.611990)*sailStates.beta + (8.925047)*sailStates.p + (-145.513718)*sailStates.q + (6.854200)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.498611)*sailStates.alpha + (0.062794)*sailStates.beta + (1.393499)*sailStates.p + (-5.397810)*sailStates.q + (-0.006203)*sailStates.r + (-0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end