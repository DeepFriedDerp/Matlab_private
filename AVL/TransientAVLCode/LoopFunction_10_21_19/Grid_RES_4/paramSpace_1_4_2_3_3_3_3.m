function [aeroForces] = paramSpace_1_4_2_3_3_3_3(sailStates,airStates)

	CL = (3.820951)*sailStates.alpha + (0.092244)*sailStates.beta + (-2.647213)*sailStates.p + (34.926060)*sailStates.q + (-0.548134)*sailStates.r + (0.010093)*sailStates.de;
	CD = -0.018780;
	CY = (0.079880)*sailStates.alpha + (-0.022537)*sailStates.beta + (-0.032901)*sailStates.p + (0.684401)*sailStates.q + (-0.006569)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.202201)*sailStates.alpha + (0.025737)*sailStates.beta + (-1.287848)*sailStates.p + (10.630807)*sailStates.q + (-0.246713)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-14.041542)*sailStates.alpha + (-0.318703)*sailStates.beta + (9.178564)*sailStates.p + (-140.146637)*sailStates.q + (1.880422)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.131985)*sailStates.alpha + (0.001743)*sailStates.beta + (-0.175388)*sailStates.p + (1.127286)*sailStates.q + (-0.032987)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end