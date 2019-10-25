function [aeroForces] = paramSpace_4_1_2_3_2_3_3(sailStates,airStates)

	CL = (4.105264)*sailStates.alpha + (0.361154)*sailStates.beta + (-2.762268)*sailStates.p + (39.455494)*sailStates.q + (1.736630)*sailStates.r + (0.011102)*sailStates.de;
	CD = -0.187410;
	CY = (0.035133)*sailStates.alpha + (-0.025386)*sailStates.beta + (0.546793)*sailStates.p + (-0.194784)*sailStates.q + (-0.108757)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.428703)*sailStates.alpha + (-0.146171)*sailStates.beta + (-1.423176)*sailStates.p + (13.020929)*sailStates.q + (1.365654)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-12.618315)*sailStates.alpha + (-1.302321)*sailStates.beta + (8.491520)*sailStates.p + (-140.845245)*sailStates.q + (-5.772564)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.303829)*sailStates.alpha + (0.051526)*sailStates.beta + (-0.999050)*sailStates.p + (3.694730)*sailStates.q + (-0.016648)*sailStates.r + (0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end