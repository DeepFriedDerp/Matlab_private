function [aeroForces] = paramSpace_4_2_3_1_2_2_3(sailStates,airStates)

	CL = (3.502774)*sailStates.alpha + (0.088051)*sailStates.beta + (-3.331893)*sailStates.p + (42.571400)*sailStates.q + (1.334224)*sailStates.r + (0.011041)*sailStates.de;
	CD = 0.095890;
	CY = (0.041282)*sailStates.alpha + (-0.025703)*sailStates.beta + (0.334251)*sailStates.p + (-0.662187)*sailStates.q + (-0.066510)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.335111)*sailStates.alpha + (-0.108054)*sailStates.beta + (-1.878182)*sailStates.p + (16.843428)*sailStates.q + (0.973337)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-12.457661)*sailStates.alpha + (-0.323066)*sailStates.beta + (10.917949)*sailStates.p + (-158.727341)*sailStates.q + (-4.482712)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.541016)*sailStates.alpha + (0.026451)*sailStates.beta + (-0.396821)*sailStates.p + (0.820337)*sailStates.q + (-0.040357)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end