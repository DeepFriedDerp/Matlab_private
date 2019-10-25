function [aeroForces] = paramSpace_4_2_2_1_3_1_2(sailStates,airStates)

	CL = (6.693718)*sailStates.alpha + (-0.129063)*sailStates.beta + (-2.359626)*sailStates.p + (27.051476)*sailStates.q + (-1.695984)*sailStates.r + (0.009115)*sailStates.de;
	CD = -2.584760;
	CY = (0.164743)*sailStates.alpha + (-0.023264)*sailStates.beta + (-1.082097)*sailStates.p + (1.664522)*sailStates.q + (0.215183)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.449572)*sailStates.alpha + (0.437527)*sailStates.beta + (-1.155830)*sailStates.p + (7.923218)*sailStates.q + (-1.769591)*sailStates.r + (0.000488)*sailStates.de;
	Cm = (-18.443001)*sailStates.alpha + (0.507525)*sailStates.beta + (10.218989)*sailStates.p + (-137.222183)*sailStates.q + (5.489859)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.866296)*sailStates.alpha + (-0.101166)*sailStates.beta + (2.611787)*sailStates.p + (-13.679941)*sailStates.q + (-0.121771)*sailStates.r + (-0.000683)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end