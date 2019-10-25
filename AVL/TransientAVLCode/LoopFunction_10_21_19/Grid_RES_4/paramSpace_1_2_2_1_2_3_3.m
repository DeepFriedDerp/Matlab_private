function [aeroForces] = paramSpace_1_2_2_1_2_3_3(sailStates,airStates)

	CL = (5.348108)*sailStates.alpha + (0.086756)*sailStates.beta + (-3.161929)*sailStates.p + (34.639286)*sailStates.q + (0.917963)*sailStates.r + (0.009448)*sailStates.de;
	CD = -1.887810;
	CY = (0.336231)*sailStates.alpha + (-0.025703)*sailStates.beta + (0.697770)*sailStates.p + (0.662190)*sailStates.q + (0.138771)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.781534)*sailStates.alpha + (-0.358410)*sailStates.beta + (-1.824407)*sailStates.p + (14.749189)*sailStates.q + (1.115174)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-14.960706)*sailStates.alpha + (-0.344583)*sailStates.beta + (12.390495)*sailStates.p + (-158.727341)*sailStates.q + (-2.920279)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.613136)*sailStates.alpha + (-0.079491)*sailStates.beta + (-1.951344)*sailStates.p + (9.708113)*sailStates.q + (-0.094100)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end