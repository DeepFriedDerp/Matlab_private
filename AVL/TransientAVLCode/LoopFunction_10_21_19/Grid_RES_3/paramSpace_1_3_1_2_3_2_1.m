function [aeroForces] = paramSpace_1_3_1_2_3_2_1(sailStates,airStates)

	CL = (3.853849)*sailStates.alpha + (0.193698)*sailStates.beta + (-2.074196)*sailStates.p + (31.880203)*sailStates.q + (-0.941259)*sailStates.r + (0.010317)*sailStates.de;
	CD = 0.044570;
	CY = (0.113195)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.294555)*sailStates.p + (0.491415)*sailStates.q + (-0.051985)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (0.983083)*sailStates.alpha + (0.175438)*sailStates.beta + (-0.791112)*sailStates.p + (6.269139)*sailStates.q + (-0.670002)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-13.350817)*sailStates.alpha + (-0.764789)*sailStates.beta + (6.745554)*sailStates.p + (-122.751358)*sailStates.q + (3.177135)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.246274)*sailStates.alpha + (0.021028)*sailStates.beta + (0.529854)*sailStates.p + (-2.365482)*sailStates.q + (-0.000253)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end